from django.db import models

from utils.models import TimestampedModelMixin


# Create your models here.

class Task(TimestampedModelMixin):
    title = models.CharField(max_length=100)
    description = models.TextField()
    completed = models.BooleanField(default=False)
