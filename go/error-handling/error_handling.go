package erratum

// Use resource opener with input string
func Use(o ResourceOpener, input string) (err error) {
	var resource Resource

	for {
		resource, err = o()
		if err == nil {
			break
		}
		if _, isTransientErr := err.(TransientError); !isTransientErr {
			return err
		}
	}
	defer func() {
		if r := recover(); r != nil {
			if ferr, isFrobErr := r.(FrobError); isFrobErr {
				resource.Defrob(ferr.defrobTag)
				err = ferr.inner
			} else {
				err = r.(error)
			}
		}
		resource.Close()
	}()

	resource.Frob(input)

	return err
}
