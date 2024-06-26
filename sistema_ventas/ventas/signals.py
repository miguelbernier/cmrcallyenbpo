from django.db.models.signals import post_migrate
from django.dispatch import receiver
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType
from ventas.models import Cliente, Dependiente, Venta, Vendedor  # Asegúrate de tener la ruta correcta

@receiver(post_migrate)
def create_custom_permissions(sender, **kwargs):
    # Definir una lista de permisos a crear
    permissions = [
        ('can_view_all_sales', 'Can view all sales', Venta),
        ('can_view_all_clients', 'Can view all clients', Cliente),
        ('can_view_all_dependents', 'Can view all dependents', Dependiente),
    ]

    # Crear permisos personalizados
    for codename, name, model in permissions:
        content_type = ContentType.objects.get_for_model(model)
        Permission.objects.get_or_create(
            codename=codename,
            name=name,
            content_type=content_type,
        )



