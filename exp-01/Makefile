topdir=..

all:
	letce2 \
		lxc \
		build \
		$(topdir)/node.cfg.d/radio.cfg \
		$(topdir)/node.cfg.d/router.cfg \
		experiment.cfg

clean:
	letce2 lxc clean
	rm -fr test-data*
