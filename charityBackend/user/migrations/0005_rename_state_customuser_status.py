# Generated by Django 5.0.4 on 2024-05-09 05:38

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0004_alter_customuser_marital_status'),
    ]

    operations = [
        migrations.RenameField(
            model_name='customuser',
            old_name='state',
            new_name='status',
        ),
    ]
