<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PoultrySystem._Default" %>
<%@ Register TagPrefix="ajax" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>Poultry Management Application.</h2>
            </hgroup>
            <p>
                This Application is a Information Management Web Applicaion that has the capability of managing poultry stock controlling process. It has several modules built in to help the process accurate and efficient.
              
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>Poultry Management Steps:</h3>
    <ol class="round">
        <li class="one">
            <h5>Order Stock</h5>
            This module manages the stock Order Process
            <a href="Default.aspx" style="color: #0000FF; font-weight: bold">Order Now…</a>
        </li>
        <li class="two">
            <h5>Place Stock</h5>
            Here you'll be able to place the Ordered Chicks in relevent Houses.
            <a href="Placement.aspx" style="color: #0000FF; font-weight: bold">Place Now…</a>
        </li>
        <li class="three">
            <h5>Process Stock</h5>
            This module Process the placed chicks according to business logics. 
            <a href="Default.aspx" style="color: #0000FF; font-weight: bold">Process Now…</a>
        </li>
    </ol>
</asp:Content>
