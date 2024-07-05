from django.urls import path
from . import views
from .views import MisVentasListView, MisClientesListView, MisDependientesListView

urlpatterns = [
    path('mis-ventas/', MisVentasListView.as_view(), name='mis_ventas'),
    path('mis-clientes/', MisClientesListView.as_view(), name='mis_clientes'),
    path('mis-dependientes/', MisDependientesListView.as_view(), name='mis_dependientes'),
]

urlpatterns = [
    path('', views.ventas_view, name='Ventas'),
    path('clientes/', views.clientes_view, name='Clientes'),
]

