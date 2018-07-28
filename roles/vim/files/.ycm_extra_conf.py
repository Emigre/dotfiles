import os
import ycm_core

home = os.path.expanduser("~")

of = os.environ['OF_ROOT'] + '/libs'

flags = [
    '-x c++',
    '-std=c++11',
    '-Wall',
    '-Wextra',
]

of_flags = flags.extend([
    '-Isrc',
    '-I' + of + '/openFrameworks',
    '-I' + of + '/openFrameworks/3d',
    '-I' + of + '/openFrameworks/app',
    '-I' + of + '/openFrameworks/communication',
    '-I' + of + '/openFrameworks/events',
    '-I' + of + '/openFrameworks/gl',
    '-I' + of + '/openFrameworks/graphics',
    '-I' + of + '/openFrameworks/math',
    '-I' + of + '/openFrameworks/sound',
    '-I' + of + '/openFrameworks/types',
    '-I' + of + '/openFrameworks/utils',
    '-I' + of + '/openFrameworks/video',
    '-I' + of + '/FreeImage/include',
    '-I' + of + '/boost/include',
    '-I' + of + '/boost/include/boost',
    '-I' + of + '/cairo/include',
    '-I' + of + '/cairo/include/cairo',
    '-I' + of + '/curl/include',
    '-I' + of + '/curl/include/curl',
    '-I' + of + '/fmodex/include',
    '-I' + of + '/freetype/include',
    '-I' + of + '/freetype/include/freetype2',
    '-I' + of + '/freetype/include/freetype2/freetype',
    '-I' + of + '/freetype/include/freetype2/freetype/config',
    '-I' + of + '/freetype/include/freetype2/freetype/internal',
    '-I' + of + '/freetype/include/freetype2/freetype/internal/services',
    '-I' + of + '/glew/include',
    '-I' + of + '/glew/include/GL',
    '-I' + of + '/glfw/include',
    '-I' + of + '/glfw/include/GLFW',
    '-I' + of + '/glm/include',
    '-I' + of + '/glm/include/glm',
    '-I' + of + '/glm/include/glm/detail',
    '-I' + of + '/glm/include/glm/gtc',
    '-I' + of + '/glm/include/glm/gtx',
    '-I' + of + '/json/include',
    '-I' + of + '/pugixml/include',
    '-I' + of + '/rtAudio/include',
    '-I' + of + '/tess2/include',
    '-I' + of + '/uriparser/include',
    '-I' + of + '/uriparser/include/uriparser',
    '-I' + of + '/utf8/include',
    '-I' + of + '/utf8/include/utf8'
])

compilation_database_folder = ''

if os.path.exists(compilation_database_folder):
    database = ycm_core.CompilationDatabase(compilation_database_folder)
else:
    database = None


def IsHeaderFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in ['.h', '.hxx', '.hpp', '.hh']


def GetCompilationInfoForFile(filename):
    if IsHeaderFile(filename):
        basename = os.path.splitext(filename)[0]
        for extension in ['.cpp', '.cxx', '.cc', '.c', '.m', '.mm']:
            replacement_file = basename + extension
            if os.path.exists(replacement_file):
                compilation_info = database.GetCompilationInfoForFile(
                    replacement_file
                )
            if compilation_info.compiler_flags_:
                return compilation_info
        return None
    return database.GetCompilationInfoForFile(filename)


def FlagsForFile(filename):
    is_openframeworks = filename.startswith(home + '/code/c++/of/')
    if is_openframeworks:
        return {
            'flags': of_flags,
            'do_cache': True
        }
    if not database:
        return {
            'flags': flags,
        }
    compilation_info = GetCompilationInfoForFile(filename)
    if not compilation_info:
        return None
    final_flags = list(compilation_info.compiler_flags_)
    return {
        'flags': final_flags,
        'do_cache': True
    }
