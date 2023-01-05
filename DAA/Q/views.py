from django.shortcuts import render

from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt

from .models import Question, Userdata
import json


@csrf_exempt
def index(request):
    question = list(Question.objects.values())
    for q in question:
        qes_obj = Question.objects.get(pk=int(q['id']))
        choices = list(qes_obj.choice_set.values())
        c = json.dumps(choices)
        q['fields'] = c
        q['name'] = 'Q' + str(q['id'])
    data = json.dumps(question)
    return render(request, "Q/index.html", {'data': data})


@csrf_exempt
def login(request):
    if request.method == "POST":
        user_data = json.loads(request.body)
        u = Userdata(username=user_data['username'], response_list=user_data['data'])
        u.save()
    return render(request, "Q/login.html")
