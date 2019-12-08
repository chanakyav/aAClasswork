import { connect } from "react-redux";
import SessionForm from './session_form';
import { HashRouter } from "react-router-dom";
import { createNewUser } from "../actions/session_actions";


const mapStateToProps = (state, ownProps) => ({
  errors: Object.values(state.errors),
  formType: 'signup' 
});

const mapDispatchToProps = (dispatch, ownProps) => ({
  processForm: () => dispatch(createNewUser())
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);