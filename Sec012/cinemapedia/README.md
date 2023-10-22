# cinemapedia

# Dev

1. Copiar el .template_env y renombrarlo a .env
1. Cambiar las variables de entorno (The MovieDB)
1. In Entities updates, execute the following command to start the build_runner:

   ```
   dart run build_runner build
   ```

   If you are using Flutter, use the following:

   ```
   flutter pub run build_runner build
   ```

# Prod

Cambiar nombre de la aplicación

Ejecutar en el directorio raiz de la aplicacion

```
flutter pub run change_app_package_name:main com.xiillii.cinemapedia
```

Para cambiar el icono de la aplicacion

```
flutter pub run flutter_launcher_icons
```

Para cambiar el splash

```
dart run flutter_native_splash:create
```

Android AAB

```
flutter build appbundle
```
