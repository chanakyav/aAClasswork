import { connect } from "react-redux";
import SessionForm from './session_form';
// import { HashRouter } from "react-router-dom";
import { loginUser } from "../actions/session_actions";


const mapStateToProps = (state, ownProps) => ({
  errors: Object.values(state.errors),
  formType: 'login'  //login
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: () => dispatch(loginUser())
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);