from django.shortcuts import render

from django.http import HttpResponse
from .models import Question
import json


def index(request):
    question = list(Question.objects.values())
    data = {}
    for q in question:
        qes_obj = Question.objects.get(pk=int(q['id']))
        choices = list(qes_obj.choice_set.values())
        c = json.dumps(choices)
        q['fields'] = c
        q['name'] = 'Q' + str(q['id'])
    data = json.dumps(question)
    return render(request, "Q/index.html", {'data': data})
    return HttpResponse("Hi")