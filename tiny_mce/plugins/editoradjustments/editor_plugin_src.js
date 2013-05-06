(function ()
{
    var Event = tinymce.dom.Event;

    tinymce.create('tinymce.plugins.EditorAdjustments', {
        init: function (ed, url)
        {
            var t = this;
            ed.onNodeChange.add(function (ed, cm, n, co)
            {
                t._addRemoveLeaderTrailer(ed, n, co);
            });

            function findCellInNextRow(currentRow)
            {
                var selectNext = false, i, j;
                for (i = 0; i < currentRow.parentNode.childNodes.length; i++)
                {
                    if (selectNext && currentRow.parentNode.childNodes[i].nodeName == 'TR')
                    {
                        for (j = 0; j < currentRow.parentNode.childNodes[i].childNodes.length; j++)
                        {
                            if (currentRow.parentNode.childNodes[i].childNodes[j].nodeName == 'TD')
                            {
                                return currentRow.parentNode.childNodes[i].childNodes[j];
                            }
                        }
                    } else if (currentRow.parentNode.childNodes[i] == currentRow)
                        selectNext = true;
                }
                return null;
            }

            function findNextCell(currentCell)
            {
                var selectNext = false, i;
                for (var i = 0; i < currentCell.parentNode.childNodes.length; i++)
                {
                    if (selectNext && currentCell.parentNode.childNodes[i].nodeName == 'TD')
                    {
                        return currentCell.parentNode.childNodes[i];
                    } else if (currentCell.parentNode.childNodes[i] == currentCell)
                        selectNext = true;
                }
                return null;
            }

            function findCellInPreviousRow(currentRow)
            {
                var selectNext = false, i, j;
                for (i = currentRow.parentNode.childNodes.length - 1; i >= 0; i--)
                {
                    if (selectNext && currentRow.parentNode.childNodes[i].nodeName == 'TR')
                    {
                        for (j = currentRow.parentNode.childNodes[i].childNodes.length - 1; j >= 0; j++)
                        {
                            if (currentRow.parentNode.childNodes[i].childNodes[j].nodeName == 'TD')
                            {
                                return currentRow.parentNode.childNodes[i].childNodes[j];
                            }
                        }
                    } else if (currentRow.parentNode.childNodes[i] == currentRow)
                        selectNext = true;
                }
                return null;
            }

            function findPreviousCell(currentCell)
            {
                var selectNext = false, i;
                for (var i = currentCell.parentNode.childNodes.length - 1; i >= 0; i--)
                {
                    if (selectNext && currentCell.parentNode.childNodes[i].nodeName == 'TD')
                    {
                        return currentCell.parentNode.childNodes[i];
                    } else if (currentCell.parentNode.childNodes[i] == currentCell)
                        selectNext = true;
                }
                return null;
            }

            function tabCancel(ed, e)
            {
                if (e.keyCode === 9)
                    return Event.cancel(e);
            }

            function tabHandler(ed, e)
            {
                var selectNext = false, nextCell = null;

                if (e.keyCode === 9)
                {
                    var n = ed.selection.getNode();

                    if (n != null && n.nodeName == 'TD')
                    {
                        var row = n.parentNode;
                        while (row.nodeName != 'TR' && row != null)
                            row = row.parentNode;

                        if (!e.shiftKey)
                        {
                            // in same row
                            nextCell = findNextCell(n);

                            // next row?
                            if (nextCell == null && row != null)
                            {
                                nextCell = findCellInNextRow(row);
                            }

                            if (nextCell == null && row != null)
                            {
                                // create a new row
                                ed.execCommand('mceTableInsertRowAfter', false);
                                nextCell = findCellInNextRow(row);
                            }
                        } else
                        {
                            // in same row
                            nextCell = findPreviousCell(n);

                            // previous row?
                            if (nextCell == null && row != null)
                            {
                                nextCell = findCellInPreviousRow(row);
                            }
                        }

                        if (nextCell != null)
                        {
                        	if (nextCell.childNodes.length == 0) {
                        		nextCell.appendChild(document.createTextNode('\u00a0'));
                        	}
                        	
                            // select the TD
                            ed.selection.select(nextCell, true);
                        }
                    } else if (n == null || n.nodeName != 'LI')
                    {
                        if (!e.shiftKey)
                        {
                            ed.execCommand('Indent', false);
                        }
                        else
                        {
                            ed.execCommand('Outdent', false);
                        }
                    }

                    if (e.preventDefault)
                    {
                        e.preventDefault();
                    }

                    return Event.cancel(e);
                }
            }

            ed.onKeyUp.add(tabCancel);

            if (tinymce.isGecko)
            {
                ed.onKeyPress.add(tabHandler);
                ed.onKeyDown.add(tabCancel);
            } else
                ed.onKeyDown.add(tabHandler);
        },
        getInfo: function ()
        {
            return {
                longname: 'Editor Adjustments for Telligent Evolution',
                author: 'Telligent Systems',
                authorurl: 'http://telligent.com/',
                infourl: 'http://telligent.com/',
                version: '1.0'
            };
        },
        _currentPlaceHolders: [],
        _addRemoveLeaderTrailer: function (ed, n, co)
        {
            if (!co)
                return;

            try
            {
                if (n.nodeName == 'TABLE' || n.nodeName == 'TD' || n.nodeName == 'TH')
                {
                    this._removeCurrentPlaceHolders();

                    var p = n;
                    while (p != null && p.nodeName != 'TABLE')
                    {
                        p = p.parentNode;
                    }

                    if (!p)
                        return;

                    this._addPlaceHolders(ed, p, /^TABLE$/);
                }
                else if (n.nodeName == 'LI' || n.nodeName == 'OL' || n.nodeName == 'UL')
                {
                    this._removeCurrentPlaceHolders();

                    var p = n;
                    while (p != null && p.nodeName != 'OL' && p.nodeName != 'UL')
                    {
                        p = p.parentNode;
                    }

                    if (!p)
                        return;

                    while (p != null && p.parentNode && (p.parentNode.nodeName == 'OL' || p.parentNode.nodeName == 'UL'))
                    {
                        p = p.parentNode;
                    }

                    if (!p)
                        return;

                    this._addPlaceHolders(ed, p, /^(?:OL|UL)$/);
                }
                else if (n.nodeName == 'P' && n.getAttribute('data-editor-adjustments') == '1')
                {
                    // remove styling of placeholder -- it's in use
                    if (n.innerHTML != '')
                    {
                        n.removeAttribute('style');
                        n.removeAttribute('data-editor-adjustments');
                    }
                }
                else
                {
                    // remove placeholders
                    this._removeCurrentPlaceHolders();
                }
            }
            catch (err)
            {
                if (console && console.error)
                    console.error("EditorAdjustments: " + err);
            }
        },
        _addPlaceHolders: function (ed, p, nn)
        {
            if (!p.previousSibling || nn.test(p.previousSibling.nodeName))
            {
                // insert a placeholder for moving above the table
                var ph = ed.dom.create('p', { style: 'padding:0;margin:0;min-height:1px;', 'data-editor-adjustments': '1' }, '');
                p.parentNode.insertBefore(ph, p);
                this._currentPlaceHolders[this._currentPlaceHolders.length] = ph;
            }

            if (!p.nextSibling || nn.test(p.nextSibling.nodeName))
            {
                // insert a placeholder for moving after the table
                var ph = ed.dom.create('p', { style: 'padding:0;margin:0;min-height:1px;', 'data-editor-adjustments': '1' }, '');
                if (p.nextSibling)
                    p.parentNode.insertBefore(ph, p.nextSibling);
                else
                    p.parentNode.appendChild(ph);

                this._currentPlaceHolders[this._currentPlaceHolders.length] = ph;
            }
        },
        _removeCurrentPlaceHolders: function ()
        {
            try
            {
                if (this._currentPlaceHolders.length > 0)
                {
                    for (var i = 0; i < this._currentPlaceHolders.length; i++)
                    {
                        if (this._currentPlaceHolders[i].getAttribute('data-editor-adjustments') == '1')
                        {
                            if (this._currentPlaceHolders[i].innerHTML != '')
                            {
                                this._currentPlaceHolders[i].removeAttribute('style');
                                this._currentPlaceHolders[i].removeAttribute('data-editor-adjustments');
                            }
                            else if (this._currentPlaceHolders[i].parentNode)
                                this._currentPlaceHolders[i].parentNode.removeChild(this._currentPlaceHolders[i]);
                        }
                    }

                    this._currentPlaceHolders = [];
                }
            }
            catch (err)
            {
                if (console && console.error)
                    console.error("EditorAdjustments: " + err);
            }
        }
    });

    tinymce.PluginManager.add('editoradjustments', tinymce.plugins.EditorAdjustments);
})();