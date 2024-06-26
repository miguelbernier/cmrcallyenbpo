# crm/forms.py
from django import forms
#from django.contrib.auth.models import User
#from django.contrib.auth.forms import UserCreationForm
from ventas.models import Cliente

class AddClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente, 
        fields = '__all__'


"""""
class ClienteForm(forms.ModelForm):
    class Meta:
        model = Cliente
        fields = '__all__'


class VentaSearchForm(forms.Form):
    query = forms.CharField(max_length=255, required=False)


class UserRegisterForm(UserCreationForm):
    email = forms.EmailField()

    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']
"""""