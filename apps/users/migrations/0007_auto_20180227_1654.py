# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-02-27 16:54
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0006_auto_20180227_1653'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userprofile',
            name='address',
            field=models.CharField(default='', max_length=100, verbose_name='地址'),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='nike_name',
            field=models.CharField(default='', max_length=50, verbose_name='昵称'),
        ),
    ]
