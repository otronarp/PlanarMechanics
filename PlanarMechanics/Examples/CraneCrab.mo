within PlanarMechanics.Examples;
model CraneCrab
  extends Modelica.Icons.Example;

  Parts.Body body(
    I=0.1,
    m=0.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-50})));
  Parts.FixedTranslation fixedTranslation(r={0,-1}) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,-10})));
  Parts.Fixed fixed annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,50})));
  Parts.Body body1(
    m=1,
    I=0.1)
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  inner PlanarWorld planarWorld
    annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
  Joints.Revolute revolute1(w(fixed=true), phi(fixed=true, start=
          2.6179938779915)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,22})));
  Joints.Prismatic prismatic1(
    r={1,0},
    v(fixed=true),
    useFlange=true,
    s(fixed=true, start=0),
    animate=true)
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-66,80})));
  Modelica.Mechanics.Translational.Components.Damper damper1(d=10)
    annotation (Placement(transformation(extent={{-50,70},{-30,90}})));
equation
  connect(fixedTranslation.frame_b, body.frame_a) annotation (Line(
      points={{-10,-20},{-10,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute1.frame_a, body1.frame_a) annotation (Line(
      points={{-10,32},{-10,50},{0,50}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute1.frame_b, fixedTranslation.frame_a) annotation (Line(
      points={{-10,12},{-10,0}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed.frame_a, prismatic1.frame_a) annotation (Line(
      points={{-60,50},{-40,50}},
      color={95,95,95},
      thickness=0.5));
  connect(prismatic1.frame_b, body1.frame_a) annotation (Line(
      points={{-20,50},{0,50}},
      color={95,95,95},
      thickness=0.5));
  connect(damper1.flange_a, fixed1.flange) annotation (Line(
      points={{-50,80},{-66,80}},
      color={0,127,0}));
  connect(damper1.flange_b, prismatic1.flange_a) annotation (Line(
      points={{-30,80},{-30,59}},
      color={0,127,0}));
  annotation (experiment(StopTime=10),
    Documentation(revisions="<html><p><img src=\"modelica://PlanarMechanics/Resources/Images/dlr_logo.png\"/> <b>Developed 2010-2014 at the DLR Institute of System Dynamics and Control</b></p></html>",  info="<html>
<h4><font color=\"#008000\">A damped crane crab </font></h4>
<p><img src=\"modelica://PlanarMechanics/Resources/Images/CraneCrab_1.png\"/></p>
<p><br/><img src=\"modelica://PlanarMechanics/Resources/Images/CraneCrab_2.png\"/></p>
<p><br/>SELECTED&nbsp;CONTINUOUS&nbsp;TIME&nbsp;STATES</p>
<p>&nbsp;&nbsp;prismatic.s</p>
<p>&nbsp;&nbsp;prismatic.v</p>
<p>&nbsp;&nbsp;revolute.phi</p>
<p>&nbsp;&nbsp;revolute.w</p>
</html>",
      revisions="<html>
<p>(c) Copyright by Dirk Zimmer</p>
<p>The library was created and is owned by Dr. Dirk Zimmer.</p>
<p>dirk.zimmer@dlr.de</p>
</html>"));
end CraneCrab;
