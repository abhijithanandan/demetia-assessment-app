import datetime

from django.db import models
from django.utils import timezone


class Userdata(models.Model):
    username = models.CharField(max_length=200)
    response_list = models.CharField(max_length=200)


class Question(models.Model):
    question_text = models.CharField(max_length=200)

    def __str__(self):
        return self.question_text


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    value = models.IntegerField('value', default=0)
    score = models.IntegerField('score', default=0)

    def __str__(self):
        return self.choice_text
