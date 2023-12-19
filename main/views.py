from django.shortcuts import render
from rest_framework import viewsets

from main.models import Task
from main.serializers import TaskSerializer


# Create your views here.


class TaskModelViewSet(viewsets.ModelViewSet):
    serializer_class = TaskSerializer
    queryset = Task.objects.all()
