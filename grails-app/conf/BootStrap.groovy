import org.pf.core.entity.Person;

class BootStrap {

    def init = { servletContext ->
		new Person(firstName: "Daia", lastName:"Yum", createdBy:"Daia", lastUpdatedBy:"Daia").save();
    }
    def destroy = {
    }
}
