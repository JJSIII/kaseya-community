/* Fast, advanced, client-side templated
TODO: document
*/
(function($){

    var templates = {},
        defaultDelimiters = {
            open: '<%',
            close: '%>'
        },
        compile = function (template, delimiters) {
            var delms = $.extend({}, defaultDelimiters, delimiters || {});
            var rawPrintExpression = new RegExp('\\' + delms.open + '=([\\s\\S]+?)' + delms.close, 'g'),
                encodedPrintExpression = new RegExp('\\' + delms.open + ':([\\s\\S]+?)' + delms.close, 'g'),
                evalExpression = new RegExp('\\' + delms.open + '(.*?)' + delms.close, 'g');
            var body = "" +
                " var source = []; " +
                " with(data){with(extraHelpers){with(defaultHelpers){ " +
                " source.push('" +
                    template
                        .replace(/[\r\n]/g, '')
                        .replace(rawPrintExpression, "'); source.push(String($1)); source.push('")
                        .replace(encodedPrintExpression, "'); source.push(escape(String($1))); source.push('")
                        .replace(evalExpression, "'); $1 source.push('") +
                "'); " +
                " }}} " +
                " return source.join('');";
            var compiled = new Function('defaultHelpers', 'extraHelpers', 'data', body);
            compiled.compiledSource = "function(defaultHelpers, extraHelpers, data) { " + body + " } ";
            return compiled;
        },
        api = {
            compile: function (source, extraHelpers, delimiters) {
                var compiledTemplate = templates[source];
                if (typeof compiledTemplate === 'undefined') {
                    var template = document.getElementById(source) !== null ? document.getElementById(source).innerHTML : source,
                        compiledTemplateInner = compile(template, delimiters);
                    templates[source] = compiledTemplate = function(data) {
                        return compiledTemplateInner.call(this, api.helpers || {}, extraHelpers || {}, data || {});
                    };
                    compiledTemplate.source = {
                        raw: template,
                        compiled: compiledTemplateInner.compiledSource
                    };
                }
                return compiledTemplate;
            },
            helpers: {
                foreach: function(items, handler) {
                    if(items && items.length > 0 && handler) {
                        for(var i = 0; i < items.length; i++) {
                            handler(items[i], i);
                        }
                    }
                },
                escape: (function(raw) {
                    var ramp = /&/g,
                        rlt = /</g,
                        rgt = />/g,
                        rqt = /\"/g,
                        eamp = '&amp;',
                        elt = '&lt;',
                        egt = '&gt;',
                        eqt = '&quot;';
                    return function(raw) {
                        var escaped = raw
                            .replace(ramp, eamp)
                            .replace(rlt, elt)
                            .replace(rgt, egt)
                            .replace(rqt, eqt);
                        return escaped;
                    };
                }())
            }
        };

    $.telligent = $.telligent || {};
    $.telligent.evolution = $.telligent.evolution || {};
    $.telligent.evolution.template = api;

}(jQuery));
