from pyexpat import model

from django.http import HttpResponse
from django.shortcuts import render
from django.views import View
from rest_framework import status
from rest_framework.generics import CreateAPIView

# Create your views here.
from rest_framework.response import Response
from rest_framework.views import APIView

from api.serializers import ContainerInTerminalSerializerCreate


class ContainerInTerminalCreate(APIView):
    def post(self, request):
        serializer = ContainerInTerminalSerializerCreate(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({"status": "success"}, status=status.HTTP_200_OK)
        else:
            return Response({"status": "error", "data": serializer.errors}, status=status.HTTP_400_BAD_REQUEST)
