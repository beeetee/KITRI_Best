<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
    <title>Ż�� ȭ��</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
    </style>
    
    <script type="text/javascript">
        // ��й�ȣ ���Է½� ���â
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.");
                return false;
            }
        }
        
        var msg = "${msg}";
		if (msg === "Wrong Password") {
			alert("�н����尡 ��ġ���� �ʽ��ϴ�.");
		}
    </script>
    
</head>
<body>
 
    <br><br>
    <b><font size="6" color="gray">�� ����</font></b>
    <br><br><br>
 
    <form name="deleteform" method="post" action="<% request.getContextPath(); %>/user/delete"
        onsubmit="return checkValue()">
        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
 
        <table>
            <tr>
                <td bgcolor="skyblue">��й�ȣ</td>
                <td><input type="pwd" name="pwd" maxlength="50"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="���" onclick="">
        <input type="submit" value="Ż��" /> 
    </form>
</body>
</html>