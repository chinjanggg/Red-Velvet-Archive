from flask import Blueprint, render_template, request, redirect

bp = Blueprint(__name__, __name__,template_folder='templates')



@bp.route('/createmember', methods=['POST', 'GET'])
def show():
    if request.method == 'POST':
        if request.form.get('createmember'):
            text = request.form.get('membertext')

            with open('python/members/{}.txt'.format(text), 'w+') as _file:
                _file.write(text)

            _file.close()

            return redirect('/')

    return render_template('createmember.html')
