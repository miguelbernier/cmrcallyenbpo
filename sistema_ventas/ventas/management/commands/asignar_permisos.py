# ventas/management/commands/asignar_permisos.py

from django.core.management.base import BaseCommand
from django.contrib.auth.models import User, Permission
from django.contrib.contenttypes.models import ContentType
from ventas.models import Venta, Cliente, Dependiente, Vendedor

class Command(BaseCommand):
    help = 'Asigna permisos específicos a usuarios'

    def handle(self, *args, **kwargs):
        usuarios = [
            {
                'username': 'Yennis',
                'password': 'y55227685',
                'permisos': [
                    'view_venta', 'view_cliente', 'view_dependiente', 'view_vendedor'
                ]
            },
            {
                'username': 'Andry',
                'password': 'ady1515',
                'permisos': [
                    'view_venta', 'view_cliente', 'view_dependiente'
                ],
                'filtro_personalizado': True
            }
        ]

        for usuario in usuarios:
            user, created = User.objects.get_or_create(username=usuario['username'])
            if created:
                user.set_password(usuario['password'])
                user.save()
                self.stdout.write(self.style.SUCCESS(f'Usuario "{usuario["username"]}" creado.'))

            for perm_codename in usuario['permisos']:
                permiso_asignado = False
                for model in [Venta, Cliente, Dependiente]:
                    try:
                        content_type = ContentType.objects.get_for_model(model)
                        perm = Permission.objects.get(
                            codename=perm_codename,
                            content_type=content_type
                        )
                        user.user_permissions.add(perm)
                        permiso_asignado = True
                    except Permission.DoesNotExist:
                        self.stdout.write(self.style.ERROR(
                            f'Permiso "{perm_codename}" no encontrado para el modelo "{model.__name__}".'
                        ))
                    except ContentType.DoesNotExist:
                        self.stdout.write(self.style.ERROR(
                            f'ContentType para el modelo "{model.__name__}" no encontrado.'
                        ))

                if permiso_asignado:
                    self.stdout.write(self.style.SUCCESS(
                        f'Permiso "{perm_codename}" asignado a "{usuario["username"]}".'
                    ))

            if 'filtro_personalizado' in usuario and usuario['filtro_personalizado']:
                self.stdout.write(self.style.WARNING(
                    f'Permisos personalizados requeridos para "{usuario["username"]}".'
                ))

        self.stdout.write(self.style.SUCCESS('Permisos asignados correctamente'))

