# Instrucciones para poner en marcha localmente todos los microservicios
    
- Clonar los repositorios y ejecutar los contenedores
    chmod +x up.sh
    ./up.sh

**Otros comandos necesarios**
- Ejecutar las migraciones
    docker exec -it laravel-database php artisan migrate:fresh --seed

- Ejecturar un worker (hilo)
    docker exec -it laravel-inscripciones php artisan queue:listen
   



*Nota: en Windows, usar Gitbash*
