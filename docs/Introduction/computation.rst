Computational Requirements
==========================

.. warning::

    Details on this page not complete

Requirements
------------
The following indicates the necessary computational requirements to learn this course.
Instructors and self-learners can choose to learn using only the sample data
provided for this course or with a new full genome. The requirements for each will be
different.

For the Course Sample Data Only
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. error::

    ADD DETAILS HERE

For a Full Genome
^^^^^^^^^^^^^^^^^

.. error::

    ADD DETAILS HERE

Options
-------

The following describes several ways to access the computational resources necessary for
this course.  Instructors are encouraged to choose the method that best suits the needs
of their students and the current compute infrastructure you have available.

The course material will provide instructions throughout for usage of each of the
following three options:

Praxis AI
^^^^^^^^^
This course is offered via a cloud-based service called `Praxis AI <http://www.prxai.com/>`__.
Instructors and students who do not have ecomputational resources onsite for students.  Praxis AI
integrates educational material with computational resources, conference and collaboration
services.  The course requires a student fee, equivalent for a text book, for access
to these services and provides predictive costs for offering the course.  Once the course
is completed students can continue to access course content via this site as a free reference.

**Advantages**

- Compute infrastructure is already available.
- You can upscale the amount of computing power as needed.
- Course material and compute are available within the same systems.
- Praxis AI is a great solution for instructors that do not have ready access to compute.

**Limitations**

- A fee is required, but at a rate similar to most textbooks.
- The base fee should cover the costs for teaching this course with the sample data
  but may not be sufficient for an entire genome.


Workstations or Compute Cluster
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
For instructors and students with access to a high-performance workstations or an
institutional compute cluster, we have created `Docker <https://www.docker.com/>`__ images
that contain all of the necessary software required for this class. The Computational
infrastructure must have a Docker service or a
`Singularity <https://docs.seylabs.io/guides/2.6/user-guide/index.html#>`__ service
installed to use these images.

.. note::
    A docker image is a minimal self-contained UNIX/Linux based-operating system pre-configured with a
    desired set of software.

For learners that have access to an institutional compute cluster you may need to
request installation of Singularity if it is not already present.

.. note::

    **Instructors**: while there are multiple job schedulers available for compute clusters,
    this course currently only provides instructions for the SLURM scheduler. If your
    cluster does not use SLURM you may have to adapt the course material to use the
    scheduler that your cluster provides.

    **Students**:  If you are self-training and you have access to a cluster but it
    does not use SLURM you will need to do a bit of searching to find the corresponding
    commands for submitting and managing jobs on your cluster.

**Advantages**

- The software needed for the course is ready to go. No installation is required.
- You can use your own compute infrastructure.
- Students receive training on compute infrastructure they may be using for other
  purposes in the future.
- No extra costs. Use the compute you already have.
- Everyone uses the same software versions in the same environment despite working
  on different machines.

**Limitations**

- Unlike Praxis AI, the course material is not embedded in an interface along with
  the computational access.  Students must connect separately to their respective
  infrastructure.
- You must ensure that the compute power is sufficient for the course.
- A bit more time is required to train students to use Singularity and Docker.

Set it up Yourself
^^^^^^^^^^^^^^^^^^
While Praxis AI and or the pre-configured Docker images make learning easiest, we
recognize that some folks prefer to learn the nitty-gritty of bioinformatics software
installation.  Within the lessons we will provide instructions.

**Advantages**

- Students learn how to install software.

**Limitations**

- It is more time consuming
- Students must have the ability to install software on the machine on which they work.
