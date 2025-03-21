dbt plugin for `Tutor <https://docs.tutor.edly.io>`__
#####################################################

Tutor plugin to extend the existing transform in aspects-dbt using a custom dbt package.

This plugin greatly reduces the effort required to add custom transforms to the aspects-dbt transformations.


Installation
************

.. code-block:: bash

    pip install git+https://github.com/edly-io/tutor-dbt

Usage
*****

First, we need to enable the aspects plugin and then the dbt plugin.


.. code-block:: bash

    tutor plugins enable aspects
    tutor config save
    tutor plugins enable dbt
    tutor config save

Now, we need to add our custom transforms. This plugin contains an aspects_dbt_extension package at the tutordbt/templates/dbt/apps/aspects_dbt_extension path where we can add our custom transforms.

Follow steps 4-5 of this `tutorial <https://docs.openedx.org/projects/openedx-aspects/en/latest/technical_documentation/how-tos/dbt_extensions.html#step-4-add-your-custom-transforms>`_ to add your custom transforms to the aspects_dbt_extension directory. The other steps have already been taken care of by this plugin.

Add any custom python requirements in the requirements.txt file present in the aspects_dbt_extension package.

After the transforms have been added, we can save our changes and rebuild the aspects image.

.. code-block:: bash

    tutor config save
    tutor images build aspects

These two steps need to be performed to pick up changes to the transforms. It is recommended to try out the transforms in the superset SQL lab as the image build process can take some time.

Finally, we can re-initialize our platform to apply the changes.

.. code-block:: bash

    tutor local do init --limit=aspects

If the platform has already been initialized once and you would only like to reapply the migrations, then we only need to build and run our migrations

.. code-block:: bash

    # Build and test your package
    tutor dev do dbt -c "build"

    # Deploy your customizations
    tutor dev do dbt -c "run"

License
*******

This software is licensed under the terms of the AGPLv3.
