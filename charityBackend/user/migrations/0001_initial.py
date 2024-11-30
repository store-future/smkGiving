# Generated by Django 5.0.4 on 2024-04-25 04:02

import datetime
import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('account', '0001_initial'),
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Location',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_id', models.IntegerField(blank=True, null=True)),
                ('account_id', models.IntegerField(blank=True, null=True)),
                ('address_line1', models.CharField(max_length=255, null=True)),
                ('address_line2', models.CharField(max_length=255, null=True)),
                ('cur_town', models.CharField(max_length=55, null=True)),
                ('state', models.CharField(max_length=55, null=True)),
                ('city', models.CharField(max_length=55, null=True)),
                ('district', models.CharField(max_length=55, null=True)),
                ('country', models.CharField(max_length=55, null=True)),
                ('pincode', models.CharField(max_length=10, null=True)),
                ('period_of_stay', models.CharField(max_length=55, null=True)),
                ('address_type', models.CharField(choices=[('permanent', 'Permanent'), ('temporary', 'Temporary')], max_length=10)),
                ('default_shipping_flag', models.BooleanField(default=False)),
                ('default_billing_flag', models.BooleanField(default=False)),
                ('default_communication', models.BooleanField(default=False)),
            ],
            options={
                'verbose_name': 'Location',
                'db_table': 'location',
            },
        ),
        migrations.CreateModel(
            name='CustomUser',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('firstname', models.CharField(max_length=100)),
                ('lastname', models.CharField(max_length=100)),
                ('gender', models.CharField(blank=True, choices=[('M', 'Male'), ('F', 'Female')], max_length=1, null=True)),
                ('dob', models.DateField(blank=True, max_length=10, null=True, verbose_name='Dob [Age]')),
                ('date_joined', models.DateField(default=datetime.date.today)),
                ('email', models.EmailField(max_length=255, unique=True)),
                ('b_phoneno', models.CharField(max_length=20, unique=True)),
                ('b_profile_pic', models.ImageField(blank=True, null=True, upload_to='profile_pic/')),
                ('nationality', models.CharField(blank=True, max_length=20, null=True)),
                ('religion', models.CharField(blank=True, max_length=20, null=True)),
                ('marital_status', models.CharField(choices=[('married', 'Married'), ('unmarried', 'Unmarried'), ('widowed', 'Widowed'), ('separated', 'Separated'), ('divorced', 'Divorced'), ('other', 'Other')], max_length=30)),
                ('highest_education', models.CharField(blank=True, max_length=255, null=True, verbose_name='[Nature of Occupation:]')),
                ('b_profession', models.CharField(blank=True, max_length=255, null=True)),
                ('identity_proof', models.CharField(blank=True, max_length=255, null=True)),
                ('identity_proof_copy', models.ImageField(blank=True, null=True, upload_to='identity_proof/')),
                ('address_proof', models.CharField(blank=True, max_length=255, null=True)),
                ('address_proof_copy', models.ImageField(blank=True, null=True, upload_to='address_proof/')),
                ('state', models.CharField(choices=[('active', 'Active'), ('inactive', 'Inactive')], max_length=10)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('user_role', models.CharField(blank=True, choices=[('benefactor', 'Benefactor'), ('requestor', 'Requestor'), ('coordinator', 'Coordinator'), ('evaluator', 'Evaluator'), ('approver', 'Approver')], max_length=20, null=True)),
                ('is_guarantor', models.BooleanField(default=False)),
                ('is_active', models.BooleanField(default=True)),
                ('is_staff', models.BooleanField(default=False)),
                ('income_proof', models.CharField(blank=True, max_length=255, null=True)),
                ('income_copy', models.ImageField(blank=True, null=True, upload_to='income_proof/')),
                ('monthly_income', models.DecimalField(decimal_places=2, default=0.0, max_digits=10)),
                ('tot_fam_income', models.DecimalField(decimal_places=2, default=0.0, max_digits=10)),
                ('tot_dependants', models.CharField(blank=True, max_length=255, null=True)),
                ('cibil_score', models.CharField(blank=True, max_length=25, null=True)),
                ('covenants_risks', models.CharField(blank=True, max_length=255, null=True)),
                ('default_account', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='account.account')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'All User',
            },
        ),
    ]
