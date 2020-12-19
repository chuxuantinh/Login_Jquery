<%@ Page Title="" Language="C#" MasterPageFile="./MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> 
   
    <script type="text/javascript" src="jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="jquery-ui-1.7.1.custom.min.js"></script>
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 16px;
	margin-top: 10px;
}

ul {
	margin: 0;
}

#contentWrap {
	width: 700px;
	margin: 0 auto;
	height: auto;
	overflow: hidden;
}

#contentTop {
	width: 600px;
	padding: 10px;
	margin-left: 30px;
}

#contentLeft {
	float: left;
	width: 400px;
}

#contentLeft li {
	list-style: none;
	margin: 0 0 4px 0;
	padding: 10px;
	background-color:#00CCCC;
	border: #CCCCCC solid 1px;
	color:#fff;
}


	

#contentRight {
	float: right;
	width: 260px;
	padding:10px;
	background-color:#336600;
	color:#FFFFFF;
}

</style>

<script type="text/javascript">
    $(document).ready(function() {

        $(function() {
            $("#contentLeft ul").sortable({ opacity: 0.6, cursor: 'move', update: function() {
                var order = $(this).sortable("serialize") + '&action=updateRecordsListings';
                $.post("Default.aspx/CheckLogin", order, function(theResponse) {

                   
                    $("#contentRight").html(theResponse);
                });
            }
            });
        });

    });	
</script>
   <script type = "text/javascript">
        function OnKeyUp(txt) {
            $("#message")[0].innerHTML = "";
        }
        
        function CheckUserLogin() {
        $.ajax({
            type: "POST",
            url: "Default.aspx/CheckLogin",
            data: '{userName: "' + $("#<%=txtUserName.ClientID%>")[0].value + '",passWord: "' + $("#<%=txtPassWord.ClientID%>")[0].value + '" }',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert(response);
            }
        });
    }
    function OnSuccess(response) {
        var mesg = $("#message")[0];

        alert(response.d);
        if (response.d == 0) {
            mesg.style.color = "red";
            mesg.innerHTML = "Invalid Username and Password;";
        } else if (response.d > 0) {
            mesg.style.color = "green";
            mesg.innerHTML = "User ID:" + response.d.toString();
        } else {
            mesg.style.color = "red";
            mesg.innerHTML = "Error:" + response.d.toString();

        }

     
    }

</script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>
        Welcome to Student Academic Blog!
    </h2>
    <p>
        Viusal Studio 2010- Authentication System asp.net using Jquery,Json and Webservices.
    </p>
   <div>
Username : <asp:TextBox ID="txtUserName" runat="server" onkeyup = "OnKeyUp(this)"></asp:TextBox><br />
Password:  <asp:TextBox ID="txtPassWord" TextMode=Password runat="server" onkeyup = "OnKeyUp(this)"></asp:TextBox>
<br />  
 <input id="btnCheck" type="button" value="Login" onclick = "CheckUserLogin()" />
    <br />
    <span id = "message">&nbsp;</spa
</div>
	<div id="contentWrap">

		<div id="contentTop">
		  <p>To read more &amp; download the demo files:		    <a href="http://www.webresourcesdepot.com/dynamic-dragn-drop-with-jquery-and-php">Dynamic Drag’n Drop With jQuery And PHP</a><br />
		  </p>
		    
		  <p>Drag'n drop the items below. Their new positions are updated in the database with an Ajax request in the backend.<img src="arrow-down.png" alt="Arrow Down" width="32" height="32" /></p>
	  </div>
	
		<div id="contentLeft">
			-------------------------------------------------------------------------------
		 <asp:BulletedList id="ItemsBulletedList" 
      BulletStyle="Disc"
      DisplayMode="LinkButton"
      
      runat="server">
        <asp:ListItem  Value="http://www.cohowinery.com">Coho Winery</asp:ListItem>
        <asp:ListItem Value="http://www.contoso.com">Contoso, Ltd.</asp:ListItem>
        <asp:ListItem Value="http://www.tailspintoys.com">Tailspin Toys</asp:ListItem>
    </asp:BulletedList>

            -------------------------------------------------------------------------------<p>.</p><p>.</p>
			<ul>
				<?php
				$query  = "SELECT * FROM records ORDER BY recordListingID ASC";
				$result = mysql_query($query);
				
				while($row = mysql_fetch_array($result, MYSQL_ASSOC))
				{
				?>
					<li id="recordsArray_<?php echo $row['recordID']; ?>"><?php echo $row['recordID'] . ". " . $row['recordText']; ?></li>
					<li id="Li1"><?php echo $row['recordID'] . ". " . $row['recordText']; ?></li>
					<li id="Li2"><?php echo $row['recordID'] . ". " . $row['recordText']; ?></li>
				<?php } ?>
			</ul>
		</div>
		
		<div id="contentRight">
		  <p>Array will be displayed here.e.</p>
		  <p>&nbsp; </p>
		</div>
	<p>.</p><p>.</p><p>.</p><p>.</p>
</asp:Content>

