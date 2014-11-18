/** @jsx React.DOM */

var QuestionsApp = require('./QuestionsApp');
var AdminForm = require('./admin/Form');
var AdminList = require('./admin/List');
var React = require('react');
var {DefaultRoute, Route, Routes} = require('react-router');

React.renderComponent((
  <Routes location="history">
    <Route path="/" handler={QuestionsApp}>
    </Route>
    <Route path="/admin/new" handler={AdminForm}>
    </Route>
    <Route path="/admin/list" handler={AdminList}>
    </Route>
  </Routes>
), document.getElementById('content'));
