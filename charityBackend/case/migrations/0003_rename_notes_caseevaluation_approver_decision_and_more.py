# Generated by Django 5.0.4 on 2024-04-30 03:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('case', '0002_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='caseevaluation',
            old_name='notes',
            new_name='approver_decision',
        ),
        migrations.AddField(
            model_name='caseevaluation',
            name='evaluator_notes',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='caseevaluation',
            name='evaluator_rating',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='casequery',
            name='answer_by_userid',
            field=models.IntegerField(blank=True, default=0, verbose_name='[Answerd By User ID]'),
        ),
        migrations.AddField(
            model_name='casequery',
            name='question_by_userid',
            field=models.IntegerField(blank=True, default=0, verbose_name='[Question By User ID]'),
        ),
        migrations.AlterField(
            model_name='case',
            name='benefactor_user_id',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='case_submit_date',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='coapplicant_user_id',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='collateral',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='disbursement_schedule',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='grant_type',
            field=models.CharField(blank=True, max_length=55, null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='guarantor_email',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='guarantor_name',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='guarantor_phone',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='guarantor_user_id',
            field=models.IntegerField(blank=True, default=0, null=True),
        ),
        migrations.AlterField(
            model_name='case',
            name='referred_by',
            field=models.CharField(blank=True, max_length=55, null=True),
        ),
    ]