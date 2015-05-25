<VirtualHost *:80>
    {% set servernames = servername.split() %}
    {% for servername in servernames %}
    {% if loop.first %}
    ServerName {{ servername }}
    {% else %}
    ServerAlias {{ servername }}
    {% endif %}
    {% endfor %}

    DocumentRoot {{ doc_root }}
    DirectoryIndex {{ directory_index }}

    <Directory {{ doc_root }}>
        Options Indexes FollowSymLinks MultiViews
        AllowOverride None
        Order allow,deny
        Allow from all
        RewriteEngine On
        RewriteCond %{REQUEST_FILENAME} !-f
        RewriteRule ^(.*)$ {{ directory_index }} [QSA,L]
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/{{ symfony.project-name }}-error-{{ ws_vhost_env }}.log

    # Possible values include: debug, info, notice, warn, error, crit,
    # alert, emerg.
    LogLevel warn

    CustomLog \${APACHE_LOG_DIR}/{{ symfony.project-name }}-access-{{ ws_vhost_env }}.log combined
</VirtualHost>