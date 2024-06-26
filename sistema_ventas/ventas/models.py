from django.db import models
from django.contrib.auth.models import Permission

class Vendedor(models.Model):
    nombre = models.CharField(max_length=100)

    class Meta:
        verbose_name = 'vendedor'
        verbose_name_plural = 'vendedores'
        permissions = [
            ("can_view_vendedores", "Can view all vendedores"),
            ("can_edit_vendedores", "Can edit vendedores"),
        ]

    def __str__(self):
        return self.nombre

class Cliente(models.Model):
    nombre = models.CharField(max_length=100)
    correo = models.EmailField(max_length=254, default='info@example.com')
    fecha_nacimiento = models.DateField()
    sexo = models.CharField(max_length=10)
    condado = models.CharField(max_length=100)
    estatus = models.CharField(max_length=100)
    estado_civil = models.CharField(max_length=100)
    taxes = models.FloatField()
    ocupacion = models.CharField(max_length=100)
    modo_declaracion = models.CharField(max_length=100)
    nombre_conyuge = models.CharField(max_length=100, blank=True, null=True)
    fecha_nacimiento_conyuge = models.DateField(blank=True, null=True)
    estatus_conyuge = models.CharField(max_length=100, blank=True, null=True)
    ocupacion_conyuge = models.CharField(max_length=100, blank=True, null=True)
    cuanto_declara_conyuge = models.FloatField(blank=True, null=True)
    aplica = models.BooleanField(default=False)
    imagen = models.ImageField(upload_to='clientes/images/', blank=True, null=True)
    audio = models.FileField(upload_to='clientes/audios/', blank=True, null=True)
    observaciones = models.TextField(max_length=1000, blank=True, null=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)  # Nuevo campo para teléfono

    class Meta:
        verbose_name = 'cliente'
        verbose_name_plural = 'clientes'
        permissions = [
            ("can_view_clientes", "Can view all clientes"),
            ("can_export_clientes", "Can export clientes data"),
            ("can_edit_clientes", "Can edit clientes"),
        ]

    def __str__(self):
        return self.nombre

class Dependiente(models.Model):
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=100)
    correo = models.EmailField(max_length=254, default='info@example.com')
    fecha_nacimiento = models.DateField()
    estatus = models.CharField(max_length=100)
    ocupacion = models.CharField(max_length=100)
    cuanto_declara = models.FloatField()
    imagen = models.ImageField(upload_to='dependientes/images/', blank=True, null=True)
    audio = models.FileField(upload_to='dependientes/audios/', blank=True, null=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    aplica = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'dependiente'
        verbose_name_plural = 'dependientes'
        permissions = [
            ("can_view_dependientes", "Can view all dependientes"),
            ("can_edit_dependientes", "Can edit dependientes"),
        ]

    def __str__(self):
        return self.nombre

class Venta(models.Model):
    vendedor = models.ForeignKey(Vendedor, on_delete=models.CASCADE)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    nombre_plan = models.CharField(max_length=100)
    compania = models.CharField(max_length=100)
    link_plan = models.URLField()
    credito_fiscal = models.FloatField()
    primas_mensual = models.FloatField()
    imagen = models.ImageField(upload_to='ventas/images/', blank=True, null=True)
    audio = models.FileField(upload_to='ventas/audios/', blank=True, null=True)

    class Meta:
        verbose_name = 'venta'
        verbose_name_plural = 'ventas'
        permissions = [
            ("view_all_sales", "Can view all sales"),
            ("can_export_sales", "Can export sales data"),
            ("can_edit_sales", "Can edit sales"),
        ]

    def __str__(self):
        return f'{self.nombre_plan} - {self.cliente.nombre}'



# Crear permisos personalizados en signals.py como se mostró anteriormente

















