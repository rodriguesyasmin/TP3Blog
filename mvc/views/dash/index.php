{{ include('layouts/header.php', {title: 'Dashboard '} )}}

<div class="wrapper">
    <h1>Dashboard!</h1>

    <div>
        {% for dash in dash %}
        <div>

            <p><small>Nom Utilisateur:</small> <small>{{ dash.userName }}</small></p>
            <p><small>Adresse IP:</small> <small>{{ dash.adresseIP }}</small></p>
            <p><small>Page:</small> <small>{{ dash.page }}</small></p>
            <p><small>Date:</small> <small>{{ dash.dateTime }}</small></p>
        </div>
        {% endfor %}
    </div>
</div>
{{ include('layouts/footer.php')}}