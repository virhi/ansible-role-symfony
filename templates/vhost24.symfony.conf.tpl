<VirtualHost *:80>
    {% set servernames = servername.split() %}
    {% for servername in servernames %}
    {% if loop.first %}
    ServerName {{ ws_vhost_env }}.{{ symfony.project_name }}.local
    {% else %}
    ServerAlias {{ ws_vhost_env }}.{{ symfony.project_name }}.local
    {% endif %}
    {% endfor %}

    DocumentRoot {{ doc_root }}
    DirectoryIndex {{ directory_index }}

    <Directory {{ doc_root }}>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride None
        Require all granted
        RewriteEngine On
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteRule ^(.*)$ {{ directory_index }} [QSA,L]
    </Directory>

    ErrorLog /vagrant/{{ symfony.project_name }}-error-{{ ws_vhost_env }}.log

    # Possible values include: debug, info, notice, warn, error, crit,
    # alert, emerg.
    LogLevel warn

    CustomLog /vagrant/log/{{ symfony.project_name }}-{{ ws_vhost_env }}-access.log combined
</VirtualHost>