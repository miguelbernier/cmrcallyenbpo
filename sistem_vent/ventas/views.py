# crm/views.py
from django.shortcuts import render
# views.py
from django.shortcuts import render
from django.shortcuts import render
from django.views.generic import ListView
from ventas.models import Venta, Cliente, Dependiente

class MisVentasListView(ListView):
    model = Venta
    template_name = 'ventas/mis_ventas.html'

    def get_queryset(self):
        user = self.request.user
        return Venta.objects.filter(usuario=user)

class MisClientesListView(ListView):
    model = Cliente
    template_name = 'clientes/mis_clientes.html'

    def get_queryset(self):
        user = self.request.user
        return Cliente.objects.filter(usuario=user)

class MisDependientesListView(ListView):
    model = Dependiente
    template_name = 'dependientes/mis_dependientes.html'

    def get_queryset(self):
        user = self.request.user
        return Dependiente.objects.filter(usuario=user)


def ventas_view(request):
    context= {
 }
    return render(request, 'ventas.html', context)

def clientes_view(request):
    context= {
 }
    return render(request, 'clientes.html', context)


    


    
    

