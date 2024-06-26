from django.apps import AppConfig

class VentasConfig(AppConfig):
    name = 'ventas'  # Cambia esto al nombre de tu aplicación

    def ready(self):
        import ventas.signals



