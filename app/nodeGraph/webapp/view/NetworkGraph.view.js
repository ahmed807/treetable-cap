sap.ui.define(["sap/ui/core/mvc/JSView"], function (JSView) {
  "use strict";

  return JSView.extend("project.networkgraph.view.NetworkGraph", {
    getControllerName: function () {
      return "project.networkgraph.controller.NetworkGraph";
    },

    createContent: function (oController) {
      return new sap.m.Page({
        title: "Network Graph",
        content: [
          new sap.suite.ui.commons.networkgraph.Graph({
            id: "graph",
            width: "100%",
            height: "600px",
            layoutAlgorithm: new sap.suite.ui.commons.networkgraph.layout.LayeredLayout(),
            nodes: {
              path: "/Nodes",
              template: new sap.suite.ui.commons.networkgraph.Node({
                key: "{ID}",
                title: "{title}",
                group: "{group}",
              }),
            },
            lines: {
              path: "/Edges",
              template: new sap.suite.ui.commons.networkgraph.Line({
                from: "{fromNode_ID}",
                to: "{toNode_ID}",
              }),
            },
          }),
        ],
      });
    },
  });
});
