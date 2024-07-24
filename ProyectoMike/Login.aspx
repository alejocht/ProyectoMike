<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoMike.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded  bg-white p-5 rounded-5 text-secondary" style="width: 25rem; border-color: #000; height: 22rem;">
        <div class="d-flex justify-content-center">
        </div>
        <div class="text-center fs-1 fw-bold">
            <h1 class="navbar-brand">MIKE</h1>
        </div>
        <div class="input-group mt-4 justify-content-center">
            <asp:TextBox ID="TxtUser" CssClass="form-control" type="text" runat="server" placeholder="Usuario"></asp:TextBox>
        </div>
        <div class="input-group mt-2 justify-content-center">
            <asp:TextBox ID="TxtPass" CssClass="form-control" type="password" placeholder="Clave" runat="server"></asp:TextBox>
        </div>
        <div class="input-group mt-1 justify-content-center">
            <asp:Button class="btn text-white w-100 mt-4" ID="Btn_loguearse" Style="background-color: #000" Text="Login" runat="server"/>
        </div>
    </div>
</div>
</asp:Content>
