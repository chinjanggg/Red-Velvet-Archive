from flask import Blueprint, render_template
import glob

bp = Blueprint(__name__, __name__,template_folder='templates')

def fetch_members():
    final_members = []
    members = glob.glob('python/members/*.txt')

    for member in members:
        with open(member) as _file:
            final_members.append(_file.read())
        _file.close()
    return final_members

@bp.route('/')
def show():
    return render_template('index.html', members=fetch_members())
