<%@ Page language="c#" Codebehind="Groups.aspx.cs" AutoEventWireup="false" Inherits="Telligent.Evolution.ControlPanel.GroupAdmin.GroupsPage" MasterPageFile="~/ControlPanel/Masters/GroupAdmin.master" %>
<%@ Import Namespace = "Telligent.Evolution.Components" %>
<%@ Import Namespace = "Telligent.Evolution.Blogs.Components" %>
<%@ Import Namespace = "Telligent.Evolution.ControlPanel" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
    <cp:resourcecontrol id="SectionDescription" runat="server" resourcename="CP_Hub_HubList_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <script type="text/javascript">
    // <![CDATA[

    function GetTree()
    {
        return eval('<%= GroupsTree.ClientID %>');
    }

    function GetCurrentGroupId()
    {
        var node = GetTree().GetSelectedNode();
        if (node == null)
        {
            alert('<%= JavaScript.Encode(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Group_SelectGroup")) %>');
            return -1;
        }
        else
            return node.Value;
    }
    
    // this function is called to get child nodes for the given parent node
    function GetChildNodes(parentTreeNode)
    {
        // call the AjaxMethod on the code-behind and send the response to getChildGroupsCallback
        GroupsPage.GetChildGroups(parentTreeNode.Value, getChildGroupsCallback);    
    }
    
    // this method gets the callback result from a child group AJAX request
    function getChildGroupsCallback(res)
    {
        if (res == null)
        {
            alert('<%= JavaScript.Encode(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Group_UnknownError")) %>');
            return;
        }
        else if (res.error)
        {
            alert(res.error);
            return;
        }
        
        // evaluate the string representation of the object into a JS object
        var parentAndChildren = null;
        eval('parentAndChildren = ' + res.value + ';');
        
        // get the parent tree node for this set of children
        var treeNode = GetTree().GetNodeByValue(parentAndChildren.parentValue);
        if (treeNode == null)
            return;
        
        // for each child, add a tree node to the parent
        for (var i = 0; i < parentAndChildren.nodes.length; i++)
        {
            treeNode.AddNode(new Telligent_TreeNode(parentAndChildren.nodes[i].html, parentAndChildren.nodes[i].value));
        }            
        
        // refresh the parent tree node
        treeNode.Refresh();
    }

    function EditGroup()
    {
        var groupId = GetCurrentGroupId();
        if (groupId < 0)
            return;
    
        var url = '<%= Globals.GetSiteUrls().UrlData.FormatUrl("hub_ControlPanel_AdminEditGroup", "{group_id}") %>';
        url = url.replace(/\{group_id\}/gi, groupId);
        window.location = url;
    }

    function DeleteGroup(groupId)
    {
        var groupId = GetCurrentGroupId();
        if (groupId < 0)
            return;
            
        if (window.confirm('<CP:ResourceControl ResourceName="CP_Group_DeleteWithApplicationsConfirmation" runat="server" Encoding="JavaScript" />'))
        {
            GroupsPage.DeleteGroup(groupId, null);
            refresh();
        }
    }

    function nodeMoved(tree, node, previousParent)
    {
		  // Ensure that they didn't move the group to the root level
		  if (!node.GetParentNode())
		  {
			  // cannot move a section to the root
			  previousParent.AddNode(node);
			  <%= GroupsTree.ClientID %>.Refresh();

			  alert('<%= JavaScript.Encode(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_Group_Tree_GroupCannotBeInRoot")) %>');
			  return;
		  }

		  var groupId = node.Value;
		  var parentGroupId = node.GetParentNode().Value;

		  var parentNode = node.GetParentNode();
		  var index = -1;
		  var idArray = new Array();

		  for (var i = 0; i < parentNode.GetNodeCount(); i++)
		  {
			  var currentId = parentNode.GetNodeAtIndex(i).Value;
			  idArray[i] = i + ":" + currentId;
  			
			  if (currentId == node.Value)
			  {
				  index = i;
			  }
		  }

		  GroupsPage.GroupMoved(groupId, parentGroupId, index, idArray, moveGroupCallback);
    }
    
    function nodeSelected(tree, node)
    {
      var deleteButton = document.getElementById('DeleteButton');
      if (!GroupsPage.IsGroupDeletable(node.Value).value)
        deleteButton.disabled = true;
      else
        deleteButton.disabled = false;
    }
    
    function moveGroupCallback(res)
    {
	    if (res == null)
		    return;

	    if (res.value != "success") {
		    if(res.value == "failure-groupname")
				alert('<%= JavaScript.Encode(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_BlogAdmin_Tree_GroupNameError")) %>');
			else
				alert('<%= JavaScript.Encode(Telligent.Evolution.ControlPanel.Components.ResourceManager.GetString("CP_BlogAdmin_Tree_GroupSaveError")) %>');
		}
    }

    // ]]>
    </script>
    
    <CP:ControlPanelSelectedNavigation runat="server" SelectedNavItem="ManageHubs" />
	<div class="CommonDescription">
	    <TEControl:ConditionalContent runat="server">
            <ContentConditions>
                <TEControl:QueryStringPropertyValueComparison runat="server" QueryStringProperty="ID" Operator="GreaterThan" ComparisonValue="-1" />
            </ContentConditions>
            <TrueContentTemplate>
                <CP:ResourceControl runat="server" ResourceName="CP_HubAdmin_NewHub_Message">
                    <Parameter1Template><TEControl:GroupData runat="server" Property="Name" LinkTo="HomePage" /></Parameter1Template>
                </CP:ResourceControl>
            </TrueContentTemplate>
            <FalseContentTemplate>
                <cp:resourcecontrol id="Section_Sub_Description" runat="server" resourcename="CP_Hub_HubList_Description" />
            </FalseContentTemplate>
        </TEControl:ConditionalContent>
	</div>
	<h3><CP:CSLiteral runat="server" ID="message" /></h3>

    <div class="CommonFormField">
        <TWC:Tree runat="server" ID="GroupsTree" style="width: 600px; height: 300px;" OnNodeSelectedClientFunction="nodeSelected" OnNodeMovedClientFunction="nodeMoved" />
    </div>
    <div class="CommonFormField">
        <input type="button" value="Edit" onclick="EditGroup(); return false;" />
        <input type="button" id="DeleteButton" value="Delete" onclick="DeleteGroup(); return false;" />
    </div>
    
</asp:Content>
