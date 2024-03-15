<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }}</title>
    <link rel="stylesheet" href="{{ asset }}/css/style.css">
</head>

<body>
    <header>
        <div class="header-img">
        </div>
        <nav>
            {% if session.privilege_id == 1 %}
            <a href="{{base}}/user/create">Users Create</a>
            <a href="{{base}}/dash">Dashboard</a>
            {% endif %}
            {% if guest %}
            <a href="{{base}}/login"> Login </a>
            {% else %}
            <a href="{{base}}/commentaire">Commentaires</a>
            <a href="{{base}}/logout">Logout</a>
            {% endif %}
        </nav>
    </header>
    <main>
        {% if guest is empty %}
        <h1> Hello, </h1>{{ session.user_name }}! {% endif%}