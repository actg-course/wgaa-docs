Software Usage: Docker
======================
This course provides a pre-configured `Docker <https://en.wikipedia.org/wiki/Docker_(software)>`__
image containing all of the software. This means you do not have to install any
software on your computational infrastructure! You can use this image if you have
either Docker or `Singularity <https://docs.sylabs.io/guides/3.5/user-guide/introduction.html>`__
installed.  If you have permission to install software on your infrastructure you
may need to install either Docker or Singularity.  If not, work with your systems
administrator.

.. note::

    Docker requires root (or administrative) access to the machine. Thus it
    is often not available on an institutional compute cluster. Singularity,
    however, does not and is often used in cases where root access is not
    given to end-users.

Docker or Singularity Installation
----------------------------------

- If you want to install Docker you can find installation instructions
  `here <https://docs.sylabs.io/guides/3.5/user-guide/introduction.html>`__.
- If you want to install Singularity you can find installation instructions
  `here <https://docs.sylabs.io/guides/3.10/admin-guide/installation.html>`__:

How to Run Software with Docker
-------------------------------
If you use Docker, anytime software is referenced in this course you can run it
by following this example:

.. code-block:: bash

    docker run -v ${PWD}:/work -u $(id -u ${USER}):$(id -g ${USER}) \
      systemsgenetics/actg-wgaa:0.1 <command>

.. note::

    The backslash character ``\`` at the end of the first line tells the
    UNIX command-line that your instruction spans more than one line. This
    is not necessary but makes it easier to read and cut-and-paste
    from documentation!

The following is the meaning of each component in that command:

- The ``-v ${PWD}:/work`` argument instructs Docker to include the current
  directory on your current machine as a new directory inside of the image and
  available at the path ``/work``.
- The Docker image is named ``systemsgenetics/actg-wgaa:0.1`` and Docker will
  download it if you've never used that image before. So be patient the first
  time you run the command.
- The ``-u $(id -u ${USER}):$(id -g ${USER})`` argument instructs Docker to run
  any commands in the image as your local account on the UNIX system you are using.
- Replace the ``<command>`` placeholder with the exact command you want to
  run.

As an example, you can print out the version of R installed with the following:

.. code-block:: bash

    docker run -v ${PWD}:/work -u $(id -u ${USER}):$(id -g ${USER}) \
      systemsgenetics/actg-wgaa:0.1 R --version


How to Run Software with Singularity
------------------------------------
If you use singularity, anytime software is referenced in this course you can run it
using Singularity by following this example:

.. code-block:: bash

    singularity exec -B ${PWD}:/work docker://systemsgenetics/actg-wgaa:0.1 <command>

The following is the meaning of each component in that command:


- The ``-v ${PWD}:/work`` argument instructs Docker to include the current
  directory on your current machine as a new directory inside of the image and
  available at the path ``/work``.
- The Docker image is named ``systemsgenetics/actg-wgaa:0.1`` and Singularity will
  download it if you've never used that image before. So be patient the first
  time you run the command.  So be patient the first time you run the command.
- Replace the ``<command>`` placeholder with the exact command you want to run.

As an example, you can print out the version of R installed with the following:

.. code-block:: bash

    singularity exec -B ${PWD}:/work docker://systemsgenetics/actg-wgaa:0.1 R --version

How to Run Docker in Interactive Mode
-------------------------------------
The instructions in the previous sections described how to run software in a Docker
image directly on the command-line.  However, if you like, you can enter inside
of the image an use the command-line terminal as if it were a stand-alone machine.

Interactive Mode with Docker
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
To run software for this course in Docker in interactive mode use the following
command to enter the image and then change into the work folder.

.. code-block:: bash

    docker run -it -v ${PWD}:/work -u $(id -u ${USER}):$(id -g ${USER}) \
      systemsgenetics/actg-wgaa:0.1 /bin/bash

    cd work

Interactive with Singularity
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
To run software for this course in Singularity in interactive mode use the following
command to enter the image and then change into the work folder.

.. code-block:: bash

    singularity shell -B ${PWD}:/work docker://systemsgenetics/actg-wgaa:0.1

    cd work
