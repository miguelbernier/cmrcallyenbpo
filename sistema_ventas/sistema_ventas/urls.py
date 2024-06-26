from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('ventas/', include('ventas.urls')),
    path('admin/', admin.site.urls),  # Ruta para el panel de administración
    path('', include('ventas.urls')),  # Incluye las URLs de tu aplicación 'ventas'
]

# Para servir archivos de medios y estáticos en desarrollo
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)


