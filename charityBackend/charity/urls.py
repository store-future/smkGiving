"""
URL configuration for charity project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,  include,re_path
from django.contrib.auth.views import LogoutView
from django.conf import settings
from django.conf.urls.static import static
from django.views.generic import TemplateView

admin.site.site_header = "Charity Admin"
admin.site.site_title = "Charity Admin Portal"
admin.site.index_title = "Welcome to Charity Portal"

urlpatterns = [
    path('admin/', admin.site.urls),
    path('case/', include('case.urls')),
    path('user/', include('user.urls')),
    path('logout', LogoutView.as_view()),
    # re_path(r'^.*$', TemplateView.as_view(template_name='index.html')),  # React fallback
 
]+ static(settings.MEDIA_URL, document_root= settings.MEDIA_ROOT)
