﻿Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class AdminChanget
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Admin") <> "" Then
            lblUser.Text = Session("Admin")
            btnLogout.Visible = True
            hlLogin.Visible = False
        Else
            btnLogout.Visible = False
            hlLogin.Visible = True
        End If
    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")
        con.Open()
        If Session("Admin") <> "" Then
            If txtNew.Text = txtConfirm.Text Then
                lblUser.Text = Session("Admin")
                Dim query_check As String = "select Password from Admin where Password='" + txtOld.Text + "';"
                Dim com_check As New SqlCommand(query_check, con)
                If com_check.ExecuteScalar <> "" Then
                    Dim query_pass As String = "update Admin set Password='" + txtNew.Text + "' where Password='" + txtOld.Text + "'and AdminUserName='" + Session("Admin") + "';"
                    Dim com_pass As New SqlCommand(query_pass, con)
                    com_pass.ExecuteNonQuery()
                    con.Close()
                    lblMessage.Text = "Your password is successfully changed."
                Else
                    lblMessage.Text = "Your password is incorrect."
                End If
            Else
                lblMessage.Text = "Check your password."
            End If
            
        Else
            lblUser.Text = " to change password."
        End If
    End Sub

    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogout.Click
        Session("Admin") = ""
        Response.Redirect("AdminLogin.aspx")
    End Sub
End Class
