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

    docker run -v ${PWD} -u $(id -u ${USER}):$(id -g ${USER}) \
      actg-course/wgaa:0.1 <command>


The ``-v ${PWD}`` argument instructs Docker to include the current directory
as a new directory in the image at the same path you are currently at. All of
the files in your current directory will be available to the image. The image is
named ``actg-course/wgaa:0.1`` and Docker will download it if you've never used
that image before. So be patient the first time you run the command.
The ``-u $(id -u ${USER}):$(id -g ${USER}) `` argument instructs Docker to run
any commands in the image as your local account on the UNIX system you are using.
Finally, replace the ``<command>`` placeholder with the exact command you want to
run. As an example, you can print out the version of R installed with the following:

.. code-block:: bash

    docker run -v ${PWD} -u $(id -u ${USER}):$(id -g ${USER}) \
      actg-course/wgaa:0.1 R --version

.. note::

    The backslash character ``\`` at the end of the first line tells the
    UNIX command-line that your instruction spans more than one line. This
    is not necessary but makes it easier to read and cut-and-paste
    from documentation!

How to Run Software with Singularity
------------------------------------
If you use singularity, anytime software is referenced in this course you can run it
using Singularity by following this example:

.. code-block:: bash

    singularity exec -B ${PWD} docker://actg-course/wgaa:0.1 <command>

The ``-v ${PWD}`` argument instructs Singularity to include the current directory
as a new directory in the image at the same path you are currently at. All of
the files in your current directory will be available to the image. The image is
named ``docker://actg-course/wgaa:0.1`` and Singularity will download it
if you've never used that image before. So be patient the first time you run the
command. Replace the ``<command>`` placeholder with the exact command you want to
run. As an example, you can print out the version of R installed with the following:

.. code-block:: bash

    singularity exec -B ${PWD} docker://actg-course/wgaa:0.1 R --version
