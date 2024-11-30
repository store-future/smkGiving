# Generated by Django 5.0.4 on 2024-04-25 04:02

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Case',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('request_amt', models.DecimalField(decimal_places=2, default=0.0, max_digits=10)),
                ('purpose', models.CharField(max_length=255, null=True)),
                ('short_description', models.TextField(blank=True, max_length=1000, null=True)),
                ('has_guarantor', models.BooleanField(default=False)),
                ('guarantor_user_id', models.IntegerField(blank=True, default=0)),
                ('guarantor_name', models.CharField(max_length=100, null=True)),
                ('guarantor_phone', models.CharField(max_length=20, null=True)),
                ('guarantor_email', models.CharField(max_length=100, null=True)),
                ('benefactor_user_id', models.IntegerField(blank=True, default=0)),
                ('coapplicant_user_id', models.IntegerField(blank=True, default=0)),
                ('referred_by', models.CharField(max_length=55, null=True)),
                ('coordinator_user_id', models.IntegerField(blank=True, default=0, verbose_name='[Coordinator User ID]')),
                ('grant_type', models.CharField(max_length=55, null=True)),
                ('approval_status', models.CharField(choices=[('draft', 'Draft'), ('new', 'New'), ('verification', 'Verification'), ('evaluation', 'Evaluation'), ('approved', 'Approved'), ('rejected', 'Rejected'), ('closed', 'Closed'), ('undecided', 'Undecided'), ('other', 'Other')], max_length=50)),
                ('disbursement_schedule', models.CharField(max_length=100, null=True)),
                ('collateral', models.CharField(max_length=100, null=True)),
                ('case_submit_date', models.CharField(max_length=20, null=True)),
                ('pending_info', models.BooleanField(default=False)),
            ],
            options={
                'db_table': 'case',
            },
        ),
        migrations.CreateModel(
            name='CasePurpose',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('purpose_name', models.CharField(max_length=255, null=True)),
                ('question_text', models.CharField(max_length=255, null=True)),
                ('answer_text', models.TextField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'case_purpose',
            },
        ),
        migrations.CreateModel(
            name='CaseQuery',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('question_text', models.CharField(max_length=255, null=True)),
                ('answer_text', models.TextField(blank=True, null=True)),
                ('supp_docs_list', models.TextField(blank=True, null=True)),
                ('question_by', models.CharField(blank=True, max_length=255, null=True)),
                ('answer_by', models.CharField(blank=True, max_length=255, null=True)),
                ('question_time', models.DateTimeField(auto_now_add=True)),
                ('answer_time', models.DateTimeField(auto_now=True)),
                ('state', models.CharField(choices=[('open', 'Open'), ('answered', 'Answered'), ('verified', 'Verified'), ('closed', 'Closed')], max_length=20)),
            ],
            options={
                'verbose_name': 'Case Querie',
                'db_table': 'case_query',
            },
        ),
        migrations.CreateModel(
            name='LovSeedData',
            fields=[
                ('lov', models.AutoField(primary_key=True, serialize=False)),
                ('lov_parent_code', models.CharField(max_length=100, null=True)),
                ('lov_code', models.CharField(max_length=100, null=True)),
                ('display_label', models.CharField(max_length=255, null=True)),
                ('input_type', models.CharField(choices=[(' ', 'NULL'), ('lov', 'LOV'), ('radio_button', 'Radio Button'), ('checkbox', 'Checkbox'), ('textbox', 'Textarea'), ('inputbox', 'Inputbox'), ('radio_button', 'Radio Button')], max_length=30)),
                ('lov_ref_code', models.CharField(max_length=60, null=True, verbose_name='Input Ref Code')),
                ('mandatory', models.CharField(choices=[('Y', 'Yes'), ('N', 'No')], max_length=20)),
                ('status', models.CharField(choices=[('active', 'Active'), ('inactive', 'Inactive')], max_length=10)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'verbose_name': 'Seed Data Lov',
                'db_table': 'lov_seed_data',
            },
        ),
        migrations.CreateModel(
            name='CaseEvaluation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_type', models.CharField(choices=[('coordinator', 'Coordinator'), ('evaluator', 'Evaluator'), ('approver', 'Approver')], max_length=20)),
                ('notes', models.TextField(blank=True, null=True)),
                ('evaluation_status', models.CharField(max_length=50, null=True)),
                ('latest_action_date', models.DateTimeField(auto_now=True)),
                ('case', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='case.case')),
            ],
            options={
                'db_table': 'case_evaluation',
            },
        ),
    ]
