﻿Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class AdminDraft
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")
        con.Open()
        If Session("Admin") = "" Then
            lblUser.Text = " please to view your Draft."
            hlLogin.Visible = True
            btnLogout.Visible = False
        Else
            lblUser.Text = Session("Admin")
            hlLogin.Visible = False
            Dim query_select As String = "select * from Draft where UserName='" + Session("Admin") + "'; "
            Dim com_select As New SqlCommand(query_select, con)
            Dim dr As SqlDataReader
            dr = com_select.ExecuteReader
            gvDraft.DataSource = dr
            DataBind()
            If gvDraft.Rows.Count.ToString() <> "0" Then
                lblCount.Text = "(" + gvDraft.Rows.Count.ToString() + ")"
                lblMessage.Text = ""
            Else
                lblCount.Text = "(0)"
                lblMessage.Text = "No message for your Draft."
                con.Close()
            End If
        End If
    End Sub

    Protected Sub btnDelete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDelete.Click
        Dim sqlcon As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True")
        sqlcon.Open()
        If Session("Admin") = "" Then
            lblUser.Text = " please to view your Draft."
        Else
            Dim draftid As Integer = Integer.Parse(Session("DraftId"))
            lblUser.Text = Session("Admin")
            Dim query_del As String = "delete from Draft where DraftId=" & draftid & ";"
            Dim com_del As New SqlCommand(query_del, sqlcon)
            com_del.ExecuteNonQuery()
            lblCount.Text = "(" + gvDraft.Rows.Count.ToString() + ")"
            Response.Redirect("AdminDraft.aspx")
            sqlcon.Close()
        End If
    End Sub

    Protected Sub btnLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogout.Click
        Session("Admin") = ""
        Response.Redirect("AdminLogin.aspx")
    End Sub

    Protected Sub gvDraft_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvDraft.RowCommand
        If e.CommandName = "Select" Then
            Session("DraftId") = e.CommandArgument
            btnDelete.Visible = True
            btnView.Visible = True
        End If
    End Sub

    Protected Sub btnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnView.Click
        Response.Redirect("AdminDraftMessage.aspx")
    End Sub
End Class
