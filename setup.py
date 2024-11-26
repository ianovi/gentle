from setuptools import setup, find_packages
from gentle import __version__

setup(
    name='gentle',
    version=__version__,
    description='Robust yet lenient forced-aligner built on Kaldi.',
    url='http://lowerquality.com/gentle',
    author='Robert M Ochshorn',
    license='MIT',
    packages=find_packages(),
    install_requires=['twisted', 'pyOpenSSL'],
    setup_requires=['wheel'],
    entry_points={
        'console_scripts': [
            'gentle-serve=serve:main',
        ],
    },
    include_package_data=True,
    package_data={
        '': ['k3', 'm3', 'ffmpeg', 'www', 'exp'],
    },
)