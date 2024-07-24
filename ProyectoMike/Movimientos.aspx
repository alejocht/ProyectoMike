<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Movimientos.aspx.cs" Inherits="ProyectoMike.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div>
            <asp:GridView ID="dgv_Movimientos" CssClass="table table-dark table-bordered" runat="server"></asp:GridView>
        </div>
        <div>
            <button class="btn btn-success">Agregar Movimiento</button>
        </div>
    </main>
</asp:Content>
