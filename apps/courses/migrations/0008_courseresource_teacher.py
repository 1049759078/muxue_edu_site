# -*- coding: utf-8 -*-
# Generated by Django 1.11.6 on 2018-02-24 23:21
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0004_teacher_image'),
        ('courses', '0007_video_learn_times'),
    ]

    operations = [
        migrations.AddField(
            model_name='courseresource',
            name='teacher',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='organization.Teacher', verbose_name='讲师'),
        ),
    ]
