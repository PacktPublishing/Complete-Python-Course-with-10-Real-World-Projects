from django.shortcuts import render
from .models import Post
from django.views import generic


# Create your views here.

class BlogView(generic.DetailView):
    model = Post
    template_name = 'blog.html'


class AboutView(generic.TemplateView):
    template_name = 'about.html'


class PostList(generic.ListView):
    queryset = Post.objects.filter(status=1).order_by('-date_created')
    template_name = 'index.html'