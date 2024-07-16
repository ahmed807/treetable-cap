sap.ui.define(["sap/ui/core/mvc/Controller"], function (Controller) {
  "use strict";

  return Controller.extend("project.networkgraph.controller.NetworkGraph", {
    onInit: function () {
      var oGraph = this.getView().byId("graph");

      // Set layout algorithm
      oGraph.setLayoutAlgorithm(new sap.suite.ui.commons.networkgraph.layout.LayeredLayout());

      // Load data from CAP service
      var oModel = new sap.ui.model.odata.v4.ODataModel({
        serviceUrl: "/catalog/",
      });
      this.getView().setModel(oModel);
    },
  });
});
