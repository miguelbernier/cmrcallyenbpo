from django.contrib import admin
from .models import Vendedor, Cliente, Dependiente, Venta
from django.db.models import Count

# Customización del sitio de administración
class MyAdminSite(admin.AdminSite):
    site_header = "Mi Sitio de Administración"
    site_title = "CallYen"
    index_title = "Bienvenido al Administrador"

    def each_context(self, request):
        context = super().each_context(request)
        context['custom_stylesheet'] = 'admin/css/admin_custom.css'
        return context

admin_site = MyAdminSite(name='myadmin')

# Inline para Dependiente
class DependienteInline(admin.TabularInline):
    model = Dependiente
    extra = 1
    fields = ('nombre', 'correo', 'telefono', 'fecha_nacimiento', 'estatus', 'ocupacion', 'cuanto_declara', 'imagen', 'audio', 'aplica')

# Inline para Venta
class VentaInline(admin.TabularInline):
    model = Venta
    extra = 1
    fields = ('vendedor', 'nombre_plan', 'compania', 'link_plan', 'credito_fiscal', 'primas_mensual', 'imagen', 'audio')

# Configurar el administrador para el modelo Venta
class VentaAdmin(admin.ModelAdmin):
    list_display = ('id', 'vendedor', 'cliente', 'nombre_plan', 'compania', 'link_plan', 'credito_fiscal', 'primas_mensual', 'imagen', 'audio')
    search_fields = ('nombre_plan', 'cliente__nombre', 'vendedor__nombre', 'compania')
    list_filter = ('compania',)
    readonly_fields = ('imagen_preview',)

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.has_perm('ventas.can_view_all_sales'):
            return qs
        return qs.filter(vendedor=request.user)

    def has_view_permission(self, request, obj=None):
        if request.user.has_perm('ventas.can_view_all_sales'):
            return True
        if obj is not None and obj.vendedor == request.user:
            return True
        return super().has_view_permission(request, obj)

    def imagen_preview(self, obj):
        if obj.imagen:
            return '<img src="{}" width="100" height="100" />'.format(obj.imagen.url)
        return 'No Image'
    imagen_preview.short_description = 'Image Preview'
    imagen_preview.allow_tags = True

admin.site.register(Venta, VentaAdmin)

# Configurar el administrador para el modelo Cliente
class ClienteAdmin(admin.ModelAdmin):
    list_display = (
        'nombre', 'telefono', 'correo', 'fecha_nacimiento', 'sexo', 'condado', 'estatus', 'estado_civil',
        'taxes', 'ocupacion', 'modo_declaracion', 'nombre_conyuge', 'fecha_nacimiento_conyuge',
        'estatus_conyuge', 'ocupacion_conyuge', 'cuanto_declara_conyuge', 'aplica',
        'get_num_dependientes', 'get_total_clientes', 'imagen', 'audio', 'observaciones'
    )
    search_fields = ('nombre', 'correo', 'condado', 'estatus', 'estado_civil', 'ocupacion')
    list_filter = ('sexo', 'estado_civil', 'aplica')
    readonly_fields = ('imagen_preview',)
    
    inlines = [DependienteInline, VentaInline]
    fields = (
        'nombre', 'telefono', 'correo', 'fecha_nacimiento', 'sexo', 'condado', 'estatus', 'estado_civil', 
        'taxes', 'ocupacion', 'modo_declaracion', 'nombre_conyuge', 'fecha_nacimiento_conyuge',
        'estatus_conyuge', 'ocupacion_conyuge', 'cuanto_declara_conyuge', 'aplica', 
        'imagen', 'audio', 'observaciones'
    )

    def get_queryset(self, request):
        queryset = super().get_queryset(request)
        queryset = queryset.annotate(
            num_dependientes=Count('dependiente', distinct=True),
            total_clientes=Count('id')
        )
        return queryset

    def get_num_dependientes(self, obj):
        return obj.num_dependientes

    get_num_dependientes.short_description = 'Num Dependientes'

    def get_total_clientes(self, obj):
        return obj.total_clientes

    get_total_clientes.short_description = 'Total Clientes'

    def imagen_preview(self, obj):
        if obj.imagen:
            return '<img src="{}" width="100" height="100" />'.format(obj.imagen.url)
        return 'No Image'
    imagen_preview.short_description = 'Image Preview'
    imagen_preview.allow_tags = True

admin.site.register(Cliente, ClienteAdmin)

# Configurar el administrador para el modelo Dependiente
class DependienteAdmin(admin.ModelAdmin):
    list_display = ('id', 'cliente', 'nombre', 'correo', 'fecha_nacimiento', 'estatus', 'ocupacion', 'cuanto_declara', 'imagen', 'audio')
    search_fields = ('nombre', 'correo', 'cliente__nombre')
    list_filter = ('estatus',)
    readonly_fields = ('imagen_preview',)

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.has_perm('ventas.can_view_all_dependents'):
            return qs
        return qs.filter(cliente__vendedor=request.user)

    def has_view_permission(self, request, obj=None):
        if request.user.has_perm('ventas.can_view_all_dependents'):
            return True
        if obj is not None and obj.cliente.vendedor == request.user:
            return True
        return super().has_view_permission(request, obj)

    def imagen_preview(self, obj):
        if obj.imagen:
            return '<img src="{}" width="100" height="100" />'.format(obj.imagen.url)
        return 'No Image'
    imagen_preview.short_description = 'Image Preview'
    imagen_preview.allow_tags = True

# No registrar Dependiente de nuevo aquí.
# admin.site.register(Dependiente, DependienteAdmin) # Esto se comenta para evitar el doble registro

# Configurar el administrador para el modelo Vendedor
@admin.register(Vendedor)
class VendedorAdmin(admin.ModelAdmin):
    list_display = ('id', 'nombre')
    search_fields = ('nombre',)

    def has_view_permission(self, request, obj=None):
        return request.user.is_superuser or request.user.groups.filter(name='Manage Users').exists()

    def has_add_permission(self, request):
        return request.user.is_superuser or request.user.groups.filter(name='Manage Users').exists()

    def has_change_permission(self, request, obj=None):
        return request.user.is_superuser or request.user.groups.filter(name='Manage Users').exists()

    def has_delete_permission(self, request, obj=None):
        return request.user.is_superuser or request.user.groups.filter(name='Manage Users').exists()

# Registrar los modelos con el sitio de administración personalizado
admin_site.register(Vendedor, VendedorAdmin)
admin_site.register(Cliente, ClienteAdmin)
admin_site.register(Venta, VentaAdmin)
admin_site.register(Dependiente, DependienteAdmin)





















