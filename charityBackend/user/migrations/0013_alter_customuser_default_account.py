# Generated by Django 5.0.4 on 2024-05-30 13:28

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0001_initial'),
        ('user', '0012_alter_customuser_marital_status_alter_location_city'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customuser',
            name='default_account',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='account.account'),
        ),
    ]